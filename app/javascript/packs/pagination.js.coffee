$ ->
  if $('#infinite-scrolling').length > 0
   $(window).on 'scroll', ->
     more_posts_url = $('.pagination .next_page a').attr('href')
     if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
         $('.pagination').text("Loading more products...")
         $.getScript more_posts_url
     return
  return