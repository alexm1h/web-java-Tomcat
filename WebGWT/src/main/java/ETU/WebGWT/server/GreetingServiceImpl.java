package ETU.WebGWT.server;

import ETU.WebGWT.client.GreetingService;
import ETU.WebGWT.shared.StudentReader;
import com.google.gwt.user.server.rpc.RemoteServiceServlet;
import java.util.*;

@SuppressWarnings("serial")
public class GreetingServiceImpl extends RemoteServiceServlet implements GreetingService {
    private Map<String, List<StudentReader>> db = null;

    public List<String> getReaderList() {
        if (db == null) initDB();
        String[] tmp = new String[db.keySet().size()];
        db.keySet().toArray(tmp);
        return Arrays.asList(tmp);
    }

    public List<StudentReader> getBookReaderList(String readerFIO) throws IllegalArgumentException {
        if (db == null) initDB();
        if (db.containsKey(readerFIO)) return db.get(readerFIO);
        else throw new IllegalArgumentException("Нет читателя " + readerFIO);
    }

    private void initDB() {
        db = new HashMap<>();
        
        List<StudentReader> list1 = new ArrayList<>();
        list1.add(new StudentReader("Андреев Дмитрий Алексеевич", "ФЭА", "4324", true));
        list1.add(new StudentReader("Беликов Иван Сергеевич", "ФЭА", "4324", true));
        list1.add(new StudentReader("Березин Максим Антонович", "ФКТИ", "4324", false));
        db.put("Иванов И. И.", list1);

        List<StudentReader> list2 = new ArrayList<>();
        list2.add(new StudentReader("Богданов Никита Константинович", "ФКТИ", "4324", true));
        list2.add(new StudentReader("Булгаков Павел Тимурович", "ФКТИ", "4324", false));
        db.put("Петров П.П.", list2);

        List<StudentReader> list3 = new ArrayList<>();
        list3.add(new StudentReader("Бунегин Вадим Константинович", "ИСГЭО", "4324", true));
        db.put("Сидоров С.С.", list3);
    }
}