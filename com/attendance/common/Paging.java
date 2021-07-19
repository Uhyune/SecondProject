package com.servlet.attendance.common;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class Paging {
    private int nowPage = 1; //현재페이지
    private int nowBlock = 1; //현재 블록(페이지 담는 단위)

    private int numPerPage = 10; //하나의 페이지에 표시할 게시글 수
    private int pagePerBlock = 5; //블록당 표시하는 페이지 갯수

    private int totalRecord = 0; //총 게시물 갯수(원본 게시글 수)
    private int totalPage = 0; //전체 페이지 갯수
    private int totalBlock = 0; //전체 블록 갯수

    private int begin = 0; //현재 페이지상의 시작 번호
    private int end = 0; //현재 페이지상의 마지막 번호

    private int beginPage = 0; //현재 블록의 시작 페이지 번호
    private int endPage = 0; //현재 블록의 끝 페이지 번호

    //전체 페이지 갯수 구하기
    //totalRecord 값을 페이지당 표시할 글의 개수 값을 나누고,
    //나머지가 있으면 페이지 하나 더 추가
    public void setTotalPage() {
        totalPage = totalRecord / numPerPage;
        if (totalRecord % numPerPage > 0)
            totalPage++;
    }
}
















