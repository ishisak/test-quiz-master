$(function (){
  $("#ans_radio").hide();
  $("#question_quiz_type").bind("change", function(){
    if ($("#question_quiz_type").val() === '1') {
      $("#ans_radio").show();
      $("#ans_sent").hide();
    } else if ($("#question_quiz_type").val() === '0') {
      $("#ans_sent").show();
      $("#ans_radio").hide();
    }
  });
});
