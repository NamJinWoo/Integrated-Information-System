package example;

public class Scholarship {
    String scholarshipName;
    int scholarshipAmount;
    double minGPA;
    String scholarshipCtgr;

    public Scholarship(String scholarshipName, int scholarshipAmount, double minGPA, String scholarshipCtgr) {
        this.scholarshipName = scholarshipName;
        this.scholarshipAmount = scholarshipAmount;
        this.minGPA = minGPA;
        this.scholarshipCtgr = scholarshipCtgr;
    }

    public String getScholarshipName() {
        return scholarshipName;
    }

    public void setScholarshipName(String scholarshipName) {
        this.scholarshipName = scholarshipName;
    }

    public int getScholarshipAmount() {
        return scholarshipAmount;
    }

    public void setScholarshipAmount(int scholarshipAmount) {
        this.scholarshipAmount = scholarshipAmount;
    }

    public double getMinGPA() {
        return minGPA;
    }

    public void setMinGPA(double minGPA) {
        this.minGPA = minGPA;
    }

    public String getScholarshipCtgr() {
        return scholarshipCtgr;
    }

    public void setScholarshipCtgr(String scholarshipCtgr) {
        this.scholarshipCtgr = scholarshipCtgr;
    }
}
