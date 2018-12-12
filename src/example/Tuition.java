package example;

public class Tuition {
    String studentId;
    int semester;
    int Calcul_Fee;
    int scholarship;

    public Tuition(String studentId, int semester, int calcul_Fee, int scholarship) {
        this.studentId = studentId;
        this.semester = semester;
        Calcul_Fee = calcul_Fee;
        this.scholarship = scholarship;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public int getSemester() {
        return semester;
    }

    public void setSemester(int semester) {
        this.semester = semester;
    }

    public int getCalcul_Fee() {
        return Calcul_Fee;
    }

    public void setCalcul_Fee(int calcul_Fee) {
        Calcul_Fee = calcul_Fee;
    }

    public int getScholarship() {
        return scholarship;
    }

    public void setScholarship(int scholarship) {
        this.scholarship = scholarship;
    }


}
