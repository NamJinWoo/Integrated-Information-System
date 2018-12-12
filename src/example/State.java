package example;

public class State {
    int stateId;
    String studentId;
    int year;
    int semester;
    boolean state;

    public State(int stateId, String studentId, int year, int semester, boolean state) {
        this.stateId = stateId;
        this.studentId = studentId;
        this.year = year;
        this.semester = semester;
        this.state = state;
    }

    public int getStateId() {
        return stateId;
    }

    public void setStateId(int stateId) {
        this.stateId = stateId;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public boolean isState() {
        return state;
    }

    public void setState(boolean state) {
        this.state = state;
    }
}
