package mvnweb5;
/**
 * Класс, описывающий студента.
 * 
 * @author Студент
 * @version 1.0
 */
public class Student {
	/**
     * Конструктор студента.
     * 
     * @param fio       ФИО
     * @param birthDate Дата рождения
     * @param faculty   Факультет
     * @param group     Группа
     */
	private String fio;
	private String birthDate;
	private String faculty;
	private String group;
	
	public Student (String fio, String birthDate, String faculty, String group) {
		this.fio = fio;
		this.birthDate = birthDate;
		this.faculty = faculty;
		this.group = group;
	}
	
	public String getFio() { return fio; }
	public String getBirthDate() { return birthDate; }
	public String getFaculty() { return faculty; }
	public String getGroup() { return group; }
	
}
