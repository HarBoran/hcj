package com.web.jdbc;

import java.sql.SQLException;

public class movie_dto {
   
   private int theater;
   private String date;
   private int movie_num;
   private String time;
   
      
   public movie_dto(int theater2, String date2, String time2) {
      super();
      this.theater = theater2;
      this.date = date2;
      this.time = time2;
   }

   public int getTheater() {
      return theater;
   }
   public void setTheater(int theater) {
      this.theater = theater;
   }
   public String getDate() {
      return date;
   }
   public void setDate(String date) {
      this.date = date;
   }
   public int getMovie_num() {
      return movie_num;
   }
   public void setMovie_num(int movie_num) {
      this.movie_num = movie_num;
   }
   public String getTime() {
      return time;
   }
   public void setTime(String time) {
      this.time = time;
   }
   @Override
   public String toString() {
      return "movie_dto [theater=" + theater + ", date=" + date + ", time=" + time + "]";
   }
   
}