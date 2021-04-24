$(document).on('click', '.edit-comment', function(event){
  event.preventDefault();

  $post_preview = $(this).closest('.post-preview');
  
  $comment_actions = $post_preview.find('.comment-actions');
  $comment_actions.find('.edit-comment').hide();
  $comment_actions.find('.delete-comment').hide();
  $comment_actions.prepend('<a class="save-comment" href="javascript:void(0)">Save</a>')
  $comment_actions.append('<a class="cancel-comment" href="javascript:void(0)">Cancel</a>')
  $comment_text = $post_preview.find('.comment-text');

  $post_preview.prepend('<div class="edit-box"><textarea class="form-control" placeholder="Write your comment here...." name="comment[body]" id="comment_body">'+ $comment_text[0].innerText +'</textarea></div>');
  $comment_text.hide();
});

$(document).on('click', '.cancel-comment', function(event){
  event.preventDefault();
  $post_preview = $(this).closest('.post-preview');

  $post_preview.find('.edit-box').remove();
  $post_preview.find('.cancel-comment').remove();
  $post_preview.find('.save-comment').remove();
  
  $comment_text.show();
  $post_preview.find('.edit-comment').show();
  $post_preview.find('.delete-comment').show();
});

$(document).on('click', '.save-comment', function(event){
  event.preventDefault();

  $post_preview = $(this).closest('.post-preview');
  $.ajax({
    url: $post_preview.find('.edit-comment').data('url'),
    type: 'PATCH',
    data: { 'comment': { 'body': $post_preview.find('.edit-box textarea').val() } }
  });
});