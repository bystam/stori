# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

MAX_LENGTH = 140
MINIMUM_WORDS = 3

$ ->
  inputArea = $ '#input-area'

  updateCounter = (event) ->
    inputLength = inputArea.val().length
    ($ '#counter').text MAX_LENGTH - inputLength

  inputArea.keyup updateCounter

  ($ '#new_story_post').submit () ->
    if inputArea.val().split(' ').length < MINIMUM_WORDS
      return false