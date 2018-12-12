package example;

public class SelSubject {
    int selectedLecture;
    String studentId;
    int lectureId;
    double gradePoint;
    String lectureName;
    String profName;
    String classroomNum;
    String classTime;
    int gradeValue;
    int lecturePoint;
    int eduSemester;
    int lectureKind;
    String lectureMajor;
    String lecturePlan;

    public String getLecturePlan() {
        return lecturePlan;
    }


    public String getLectureName() {
        return lectureName;
    }

    public String getProfName() {
        return profName;
    }

    public String getClassroomNum() {
        return classroomNum;
    }

    public String getClassTime() {
        return classTime;
    }

    public int getGradeValue() {
        return gradeValue;
    }

    public int getLectureKind() {
        return lectureKind;
    }

    public String getLectureMajor() {
        return lectureMajor;
    }


    public SelSubject(int lectureId, String lectureName, String profName, String classroomNum, String classTime, int gradeValue, int lectureKind, String lectureMajor, String lecturePlan, double gradePoint, int eduSemester) {
        this.lectureId = lectureId;
        this.gradePoint = gradePoint;
        this.lectureName = lectureName;
        this.profName = profName;
        this.classroomNum = classroomNum;
        this.classTime = classTime;
        this.gradeValue = gradeValue;
        this.lectureKind = lectureKind;
        this.lectureMajor = lectureMajor;
        this.lecturePlan = lecturePlan;
        this.eduSemester = eduSemester;
    }

    public int getSelectedLecture() {
        return selectedLecture;
    }

    public void setSelectedLecture(int selectedLecture) {
        this.selectedLecture = selectedLecture;
    }

    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public int getLectureId() {
        return lectureId;
    }

    public void setLectureId(int lectureId) {
        this.lectureId = lectureId;
    }

    public double getGradePoint() {
        return gradePoint;
    }

    public void setGradePoint(double gradePoint) {
        this.gradePoint = gradePoint;
    }

    public int getLecturePoint() {
        return lecturePoint;
    }

    public void setLecturePoint(int lecturePoint) {
        this.lecturePoint = lecturePoint;
    }

    public int getEduSemester() {
        return eduSemester;
    }

    public void setEduSemester(int eduSemester) {
        this.eduSemester = eduSemester;
    }

}
