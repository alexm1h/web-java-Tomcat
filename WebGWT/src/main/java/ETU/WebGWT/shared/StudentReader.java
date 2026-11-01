package ETU.WebGWT.shared;

import java.io.Serializable;

public class StudentReader implements Serializable {
	private static final long serialVersionUID = 1L;

    private String fio;
    private String faculty;
    private String group;
    private boolean isReader;
    
    public StudentReader() {}
    
    public StudentReader(String fio, String faculty, String group, boolean isReader) {
        this.fio = fio;
        this.faculty = faculty;
        this.group = group;
        this.isReader = isReader;
    }
    
    public String getFio() { return fio; }
    public void setFio(String fio) { this.fio = fio; }

    public String getFaculty() { return faculty; }
    public void setFaculty(String faculty) { this.faculty = faculty; }

    public String getGroup() { return group; }
    public void setGroup(String group) { this.group = group; }

    public boolean isReader() { return isReader; }
    public void setReader(boolean reader) { isReader = reader; }
}
