App.chatroom = App.cable.subscriptions.create "ChatroomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']
    $('#message_content').val''
    scrollToBottom()
    return
    
  jQuery(document).on 'turbolinks:load', ->
    scrollToBottom()
    return
    
  scrollToBottom = ->
    if $('#messages').length > 0
      $('#messages').scrollTop $('#messages')[0].scrollHeight
    return
  
  $(document).ready ->
    scrollToBottom()
    return

    # Called when there's incoming data on the websocket for this channel

    ### code to submit message on pressing enter - not working - 13 for key - 
    maybe issue with c9? 
    
  scrollToBottom = ->
    if $('#messages').length > 0
    $('#messages').scrollTop $('#messages')[0].scrollHeight
    return
  
  submitMessage = (event) ->
    event.preventDefault()
    $('#new_message').submit()
    return
  
  $(document).on 'keypress', '[data-behavior~=speaker]', (event) ->
    if event.keyCode == 13
      submitMessage event
    return
  $(document).on 'click', '[data-send~=message]', (event) ->
    submitMessage event
    return
  $(document).ready ->
    $('#new_message').on 'ajax:complete', (e, data, status) ->
      $('#message_content').val ''
      return
    scrollToBottom()
    return
###