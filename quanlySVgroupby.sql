use quanlysinhvien;
select *
from class;

select *
from subject;

select *
from student;

select *
from mark;

# 1. Sử dụng hàm count để hiển thị số lượng sinh viên ở từng nơi
select Address, count(StudentID) AS 'Số lượng học viên'
from student
group by Address;

#2. Tính điểm trung bình các môn học của mỗi học viên bằng cách sử dụng hàm AVG
select S.StudentName, S.StudentID, avg(Mark)
from student S
         join mark m on S.StudentID = m.StudentID
group by S.StudentName, s.StudentID;

# 3. Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15

select S.StudentID, StudentName, avg(Mark)
from student S
         join mark m on S.StudentID = m.StudentID
group by S.StudentID, StudentName
having avg(Mark) > 9;

# 4. Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
select S.StudentID, StudentName, avg(Mark)
from student S
         join mark m on S.StudentID = m.StudentID
group by S.StudentID, StudentName
having avg(Mark) >= all(select avg(Mark)from mark group by mark.StudentID);