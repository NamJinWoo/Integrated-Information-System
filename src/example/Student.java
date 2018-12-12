package example;

public class Student {

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStudentAttr() {
        return studentAttr;
    }

    public void setStudentAttr(String studentAttr) {
        this.studentAttr = studentAttr;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }



    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }
    String studentId;

    public String getStudentId() {
        return studentId;
    }

    String password;
    String studentAttr;
    String major;
    boolean state;
    String studentName;
    String email;
    int semester;

    public Student(String studentId, String studentName, String password, String studentAttr, String major, boolean state, String email, int semester) {
        this.studentId = studentId;
        this.password = password;
        this.studentAttr = studentAttr;
        this.major = major;
        this.state = state;
        this.studentName = studentName;
        this.email = email;
        this.semester = semester;
    }
}
