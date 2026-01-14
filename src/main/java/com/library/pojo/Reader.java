package com.library.pojo;

import java.io.Serializable;
import java.util.Date;

public class Reader implements Serializable {
    private Integer readerId;
    private String studentNo;
    private String name;
    private String gender;
    private String phone;
    private String email;
    private String department;
    private Integer borrowLimit;
    private Integer borrowedCount;
    private Integer status;
    private Date createTime;

    public Reader() {
    }

    public Reader(Integer readerId, String studentNo, String name, String gender, String phone, String email, String department, Integer borrowLimit, Integer borrowedCount, Integer status, Date createTime) {
        this.readerId = readerId;
        this.studentNo = studentNo;
        this.name = name;
        this.gender = gender;
        this.phone = phone;
        this.email = email;
        this.department = department;
        this.borrowLimit = borrowLimit;
        this.borrowedCount = borrowedCount;
        this.status = status;
        this.createTime = createTime;
    }

    public Integer getReaderId() {
        return readerId;
    }

    public void setReaderId(Integer readerId) {
        this.readerId = readerId;
    }

    public String getStudentNo() {
        return studentNo;
    }

    public void setStudentNo(String studentNo) {
        this.studentNo = studentNo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public Integer getBorrowLimit() {
        return borrowLimit;
    }

    public void setBorrowLimit(Integer borrowLimit) {
        this.borrowLimit = borrowLimit;
    }

    public Integer getBorrowedCount() {
        return borrowedCount;
    }

    public void setBorrowedCount(Integer borrowedCount) {
        this.borrowedCount = borrowedCount;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "Reader{" +
                "readerId=" + readerId +
                ", studentNo='" + studentNo + '\'' +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", department='" + department + '\'' +
                ", borrowLimit=" + borrowLimit +
                ", borrowedCount=" + borrowedCount +
                ", status=" + status +
                ", createTime=" + createTime +
                '}';
    }
}
