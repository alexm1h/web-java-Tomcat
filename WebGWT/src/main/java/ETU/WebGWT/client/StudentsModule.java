package ETU.WebGWT.client;

import ETU.WebGWT.shared.StudentReader;
import java.util.List;

import com.google.gwt.user.cellview.client.HasKeyboardSelectionPolicy;
import com.google.gwt.core.client.EntryPoint;
import com.google.gwt.core.client.GWT;
import com.google.gwt.event.dom.client.ClickEvent;
import com.google.gwt.event.dom.client.ClickHandler;
import com.google.gwt.user.client.rpc.AsyncCallback;
import com.google.gwt.user.client.ui.*;
import com.google.gwt.view.client.*;
import com.google.gwt.user.cellview.client.CellTable;
import com.google.gwt.user.cellview.client.TextColumn;

public class StudentsModule implements EntryPoint {

    private final GreetingServiceAsync greetingService = GWT.create(GreetingService.class);
    private static final String SRV_ERR = "Ошибка сервера!";
    private static final String SRV_ERR_GET_READER_LIST = "Невозможно получить список читателей.";
    private static final String SRV_ERR_GET_BOOK_LIST = "Невозможно получить список студентов.";
    private static final String GET_READER_LIST_BTN = "Получить список студентов.";
    private static final String CLOSE_BTN = "Закрыть";
    private static final String BOOKS_WND_TITLE = "Список студентов читателя ";
    private static final String SERVER_ERROR = "An error occurred while attempting to contact the server.";

    public void onModuleLoad() {
        final ListBox readerListBox = new ListBox(false);
        final Label errorLabel = new Label();
        final Button sendButton = new Button(GET_READER_LIST_BTN);

        RootPanel.get("readerListBoxContainer").add(readerListBox);
        RootPanel.get("errorLabelContainer").add(errorLabel);
        RootPanel.get("sendButtonContainer").add(sendButton);
        
        readerListBox.setFocus(true);

        greetingService.getReaderList(new AsyncCallback<List<String>>() {
            public void onFailure(Throwable caught) {
                errorLabel.setText(SRV_ERR + SRV_ERR_GET_READER_LIST);
            }
            public void onSuccess(List<String> result) {
                for (String r : result) readerListBox.addItem(r);
            }
        });

        final DialogBox dialogBox = new DialogBox();
        dialogBox.setText(BOOKS_WND_TITLE);
        dialogBox.setAnimationEnabled(true);
        final Button closeButton = new Button(CLOSE_BTN);
        final HTML serverResponseLabel = new HTML();
        VerticalPanel dialogVPanel = new VerticalPanel();
        dialogVPanel.addStyleName("dialogVPanel");

        final CellTable<StudentReader> table = createCellTable();
        dialogVPanel.add(table);

        dialogVPanel.setHorizontalAlignment(VerticalPanel.ALIGN_RIGHT);
        dialogVPanel.add(closeButton);
        dialogBox.setWidget(dialogVPanel);

        closeButton.addClickHandler(new ClickHandler() {
            public void onClick(ClickEvent event) {
                dialogBox.hide();
                sendButton.setEnabled(true);
                sendButton.setFocus(true);
            }
        });

        class RPClickHandler implements ClickHandler {
            public void onClick(ClickEvent event) {
                sendReaderFIOToServer();
            }

            private void sendReaderFIOToServer() {
                errorLabel.setText("");
                final String readerFIO = readerListBox.getValue(readerListBox.getSelectedIndex());
                sendButton.setEnabled(false);

                greetingService.getBookReaderList(readerFIO, new AsyncCallback<List<StudentReader>>() {
                    public void onFailure(Throwable caught) {
                        dialogBox.setText(SRV_ERR);
                        serverResponseLabel.addStyleName("serverResponseLabelError");
                        serverResponseLabel.setHTML(SRV_ERR + SRV_ERR_GET_BOOK_LIST);
                        dialogBox.center();
                        closeButton.setFocus(true);
                    }
                    public void onSuccess(List<StudentReader> result) {
                        dialogBox.setText(BOOKS_WND_TITLE + readerFIO);
                        table.setRowCount(result.size(), true);
                        table.setRowData(0, result);
                        dialogBox.center();
                        closeButton.setFocus(true);
                    }
                });
            }
        }
        
        RPClickHandler handler = new RPClickHandler();
        sendButton.addClickHandler(handler);
    }

    private CellTable<StudentReader> createCellTable() {
        final CellTable<StudentReader> table = new CellTable<>();
        table.setKeyboardSelectionPolicy(HasKeyboardSelectionPolicy.KeyboardSelectionPolicy.ENABLED);

        TextColumn<StudentReader> fioColumn = new TextColumn<StudentReader>() {
            public String getValue(StudentReader object) { return object.getFio(); }
        };
        table.addColumn(fioColumn, "ФИО");

        TextColumn<StudentReader> facultyColumn = new TextColumn<StudentReader>() {
            public String getValue(StudentReader object) { return object.getFaculty(); }
        };
        table.addColumn(facultyColumn, "Факультет");

        TextColumn<StudentReader> groupColumn = new TextColumn<StudentReader>() {
            public String getValue(StudentReader object) { return object.getGroup(); }
        };
        table.addColumn(groupColumn, "Группа");

        TextColumn<StudentReader> readColumn = new TextColumn<StudentReader>() {
            public String getValue(StudentReader object) { return object.isReader() ? "Да" : "Нет"; }
        };
        table.addColumn(readColumn, "Прочитал");

        return table;
    }
}