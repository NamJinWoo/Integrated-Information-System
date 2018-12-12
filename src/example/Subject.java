package example;

public class Subject {
    int lectureId;
    String lectureName;
    String profName;
    String classroomNum;
    String classTime;
    int gradeValue;
    int eduYear;
    int maxStudents;
    int lectureKind;
    String lectureMajor;
    String lecturePlan;
    int presentStudent;

    public Subject(int lectureId, String lectureName, String profName, String classroomNum, String classTime, int gradeValue, int eduYear, int maxStudents, int lectureKind, String lectureMajor, String lecturePlan, int presentStudent) {
        this.lectureId = lectureId;
        this.lectureName = lectureName;
        this.profName = profName;
        this.classroomNum = classroomNum;
        this.classTime = classTime;
        this.gradeValue = gradeValue;
        this.eduYear = eduYear;
        this.maxStudents = maxStudents;
        this.lectureKind = lectureKind;
        this.lectureMajor = lectureMajor;
        this.lecturePlan = lecturePlan;
        this.presentStudent = presentStudent;
    }

    public int getPresentStudent() {
        return presentStudent;
    }


    public int getLectureId() {
        return lectureId;
    }

    public void setLectureId(int lectureId) {
        this.lectureId = lectureId;
    }

    public String getLectureName() {
        return lectureName;
    }

    public void setLectureName(String lectureName) {
        this.lectureName = lectureName;
    }

    public String getProfName() {
        return profName;
    }

    public void setProfName(String profName) {
        this.profName = profName;
    }

    public String getClassroomNum() {
        return classroomNum;
    }

    public void setClassroomNum(String classroomNum) {
        this.classroomNum = classroomNum;
    }

    public String getClassTime() {
        return classTime;
    }

    public void setClassTime(String classTime) {
        this.classTime = classTime;
    }

    public int getGradeValue() {
        return gradeValue;
    }

    public void setGradeValue(int gradeValue) {
        this.gradeValue = gradeValue;
    }

    public int getEduYear() {
        return eduYear;
    }

    public void setEduYear(int eduYear) {
        this.eduYear = eduYear;
    }

    public int getMaxStudents() {
        return maxStudents;
    }

    public void setMaxStudents(int maxStudents) {
        this.maxStudents = maxStudents;
    }

    public int getLectureKind() {
        return lectureKind;
    }

    public void setLectureKind(int lectureKind) {
        this.lectureKind = lectureKind;
    }

    public String getLectureMajor() {
        return lectureMajor;
    }

    public void setLectureMajor(String lectureMajor) {
        this.lectureMajor = lectureMajor;
    }

    public String getLecturePlan() {
        return lecturePlan;
    }

    public void setLecturePlan(String lecturePlan) {
        this.lecturePlan = lecturePlan;
    }
}
