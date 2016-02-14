$(function (){
  $("#ans_radio").hide();
  $("#question_quiz_type").on("change", function(){
    $("#ans_radio").toggle();
    $("#ans_sent").toggle();
  });
});
