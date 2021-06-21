$('.user-check-box').on('change', function() {
  let userId = this.id.split('_').pop();
  $.ajax({
    type: "PATCH",
    dataType: "script",
    url: '/admin/users/userId/update_mailing_status',
    data: { id: userId, mailing_status: this.checked }
  });
})
