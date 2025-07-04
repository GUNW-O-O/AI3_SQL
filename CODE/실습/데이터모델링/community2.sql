-- Active: 1745889699734@@127.0.0.1@3306@community

-- CREATE DATABASE `community`
--     DEFAULT CHARACTER SET = 'utf8mb4';

DROP TABLE IF EXISTS `files`;
DROP TABLE IF EXISTS `comments`;
DROP TABLE IF EXISTS `posts`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
	`no`	BIGINT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT 'PK',
	`id`	VARCHAR(64)	NOT NULL UNIQUE	COMMENT 'UK',
	`username`	VARCHAR(100)	NOT NULL	COMMENT '아이디',
	`password`	VARCHAR(100)	NOT NULL	COMMENT '비밀번호',
	`name`	VARCHAR(50)	NOT NULL	COMMENT '이름',
	`email`	VARCHAR(200)	NOT NULL	COMMENT '이메일',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자'
) COMMENT '회원';


CREATE TABLE `posts` (
	`no`	BIGINT	NOT NULL	AUTO_INCREMENT PRIMARY KEY COMMENT '번호',
	`id`	VARCHAR(64)	NOT NULL UNIQUE	COMMENT 'UK',
	`user_no`	BIGINT	NOT NULL	COMMENT '회원번호',
	`title`	VARCHAR(200)	NOT NULL	COMMENT '제목',
	`content`	TEXT	NULL	COMMENT '내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자',
	Foreign Key (`user_no`) REFERENCES `users`(`no`)
) COMMENT '게시글';


CREATE TABLE `comments` (
	`no`	BIGINT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT 'PK',
	`id`	VARCHAR(64)	NOT NULL UNIQUE	COMMENT 'UK',
	`post_no`	BIGINT	NOT NULL	COMMENT '댓글번호',
	`user_no`	BIGINT	NOT NULL	COMMENT '회원번호',
	`content`	TEXT	NOT NULL	COMMENT '내용',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자',
	Foreign Key (`post_no`) REFERENCES `posts`(`no`),
	Foreign Key (`user_no`) REFERENCES `users`(`no`)
) COMMENT '댓글';




CREATE TABLE `files` (
	`no`	BIGINT	NOT NULL AUTO_INCREMENT PRIMARY KEY	COMMENT 'PK',
	`id`	VARCHAR(64)	NOT NULL UNIQUE	COMMENT 'UK',
	`post_no`	BIGINT	NOT NULL	COMMENT '파일번호',
	`file_name`	TEXT	NOT NULL	COMMENT '파일명',
	`file_path`	TEXT	NOT NULL	COMMENT '파일경로',
	`created_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '등록일자',
	`updated_at`	TIMESTAMP	NOT NULL	DEFAULT CURRENT_TIMESTAMP	COMMENT '수정일자',
	Foreign Key (`post_no`) REFERENCES `posts`(`no`)
) COMMENT '파일';

