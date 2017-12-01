$ ->
  if $('.pagination').length && $('#feeds').length
    $(window).scroll ->
      url = $('.pagination .next_page').attr('href')
      if url && $(window).scrollTop() > $(document).height() - $(window).height() - 50
        $('.pagination').text('Загрузка...')
        $.getScript(url)
    $(window).scroll()
