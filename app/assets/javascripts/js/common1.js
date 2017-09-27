$(function() {
  //push button with id="save"
  $('#save').click(function() {
    var formValid = true;
    //finde all elements input
    $('input').each(function() {
    //finde parents, which have class .form-group, for setting success/error
    var formGroup = $(this).parents('.form-group');
    //finde glyphicon, wich is showing success or error
    var glyphicon = formGroup.find('.form-control-feedback');
    //or validatin use HTML5 function checkValidity
    if (this.checkValidity()) {
      //add to formGroup class .has-success, delete has-error
      formGroup.addClass('has-success').removeClass('has-error');
      //add to glyphicon class glyphicon-ok, delete glyphicon-remove
      glyphicon.addClass('glyphicon-ok').removeClass('glyphicon-remove');
    } else {
      //add to formGroup csass .has-error, delete .has-success
      formGroup.addClass('has-error').removeClass('has-success');
      //add to glyphicon class glyphicon-remove, delete glyphicon-ok
      glyphicon.addClass('glyphicon-remove').removeClass('glyphicon-ok');
      formValid = false;
    }
  });
  //if form is valid
  if (formValid) {
    //hide modal window
    $('#dlModal').modal('hide');
    //show success alert
    $('#success-alert').removeClass('hidden');
    //send post request
    $('#submit_form').submit();
  }
});
});
