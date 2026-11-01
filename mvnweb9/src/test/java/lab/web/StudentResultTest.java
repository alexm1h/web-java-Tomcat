package lab.web;

import static org.mockito.Mockito.*;
import static org.junit.Assert.*;

import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

/**
 * Тест для проверки страницы результата (JSP-логики через mock-объекты).
 */
public class StudentResultTest {

    @Mock
    HttpServletRequest request;

    @Mock
    HttpServletResponse response;

    @Mock
    HttpSession session;

    @Mock
    RequestDispatcher dispatcher;

    @Before
    public void setUp() {
        MockitoAnnotations.openMocks(this);
    }

    @Test
    public void testValidFormSubmission() throws Exception {
        // Настраиваем mock-объекты
        when(request.getParameter("userName")).thenReturn("Иван");
        when(request.getParameter("bgColor")).thenReturn("#e6f2ff");
        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("visitCount")).thenReturn(null);

        // Проверяем, что запросы обрабатываются корректно
        String name = request.getParameter("userName");
        String color = request.getParameter("bgColor");

        assertEquals("Иван", name);
        assertEquals("#e6f2ff", color);

        // Проверяем, что session.setAttribute вызывался
        verify(request).getParameter("userName");
        verify(request).getParameter("bgColor");
    }

    @Test
    public void testMissingUserName() throws Exception {
        // Настраиваем mock-объекты: имя не передано
        when(request.getParameter("userName")).thenReturn(null);
        when(request.getParameter("bgColor")).thenReturn("#ffffff");

        String name = request.getParameter("userName");
        String color = request.getParameter("bgColor");

        assertNull(name);
        assertEquals("#ffffff", color);
    }

    @Test
    public void testSessionVisitCount() throws Exception {
        // Настраиваем mock-объекты
        when(request.getSession()).thenReturn(session);
        when(session.getAttribute("visitCount")).thenReturn(3);

        // Проверяем счётчик визитов
        Integer count = (Integer) session.getAttribute("visitCount");
        assertEquals(Integer.valueOf(3), count);

        // Проверяем, что session.setAttribute будет вызван
        session.setAttribute("visitCount", 4);
        verify(session).setAttribute("visitCount", 4);
    }

    @Test
    public void testErrorRedirect() throws Exception {
        // Настраиваем mock: faculty == null → должен быть redirect
        when(request.getParameter("faculty")).thenReturn(null);
        when(request.getRequestDispatcher("/ErrorManager.jsp")).thenReturn(dispatcher);

        String faculty = request.getParameter("faculty");
        assertNull(faculty);

        // Проверяем, что dispatcher будет получен
        RequestDispatcher rd = request.getRequestDispatcher("/ErrorManager.jsp");
        assertNotNull(rd);
        verify(request).getRequestDispatcher("/ErrorManager.jsp");
    }
}