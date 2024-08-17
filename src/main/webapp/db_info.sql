CREATE DATABASE hara1029;

USE hara1029;

CREATE TABLE member (
	id VARCHAR(10),
    pw VARCHAR(10),
    name VARCHAR(10),
    gender VARCHAR(5)
);

INSERT INTO member (id, pw, name, gender) VALUES ('가오리', 1111, '현관용', '남성');
INSERT INTO member (id, pw, name, gender) VALUES ('수달', 2222, '홍민주', '선택안함');
INSERT INTO member (id, pw, name, gender) VALUES ('강아지', 3333, '정소라', '여성');
INSERT INTO member (id, pw, name, gender) VALUES ('고양이', 4444, '고유나', '선택안함');

CREATE TABLE admin (
	id VARCHAR(10),
    pw VARCHAR(10)
);

INSERT INTO admin (id, pw) VALUES ('hara', '1q2w3e4r!');

SELECT COUNT(*) FROM admin WHERE id='hara' AND pw='1q2w3e4r!';