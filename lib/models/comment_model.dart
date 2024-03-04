class Comment
{
   final String message;
   final String ID;

   Comment(this.message,this.ID);

   factory Comment.fromJson(jsonData)
   {
     return Comment(jsonData['message'], jsonData['userID']);
   }
}