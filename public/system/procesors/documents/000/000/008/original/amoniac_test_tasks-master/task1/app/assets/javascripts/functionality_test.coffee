document.addEventListener('DOMContentLoaded', ->
  # Elements finding
  forms_block = document.getElementById('forms')
  create_btn = document.getElementById('create')
  send_btn = document.getElementById('send')
  clear_btn = document.getElementById('clear')

  # Code to insert
  fields_code = '
    <hr/>
    <div class="form-group">
      <label>Key:</label>
      <input type="text" name="key" class="form-control"></input>
    </div>
    <div class="form-group">
      <label>Value:</label>
      <input type="text" name="value" class="form-control"></input>
    </div>
    <hr/>
  '

  # Click event listener
  document.addEventListener('click', (e) ->
    e.preventDefault()
    if e.target == create_btn
      createForm()
    else if e.target == send_btn
      sendForms(e)
    else if e.target == clear_btn
      clearForms()
  )

  # Handlers
  createForm = ->
    block = document.createElement('form')
    block.dataset.pair = true
    block.innerHTML = fields_code
    forms_block.appendChild(block)

  sendForms = (e) ->
    result_obj = {}
    pairs = forms_block.querySelectorAll('[data-pair]')
    for pair in pairs
      result_obj[pair.querySelector('[name="key"]').value] =
        pair.querySelector('[name="value"]').value
    console.log(result_obj)

    window.fetch(
      'collect/data'
      credentials: 'same-origin'
      method: 'POST'
      headers: new Headers(
        'Content-Type': 'application/json', 
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content)
      body: JSON.stringify({data: result_obj})
    ).then((resp) -> resp.json()
    ).then((data) -> showResult(JSON.stringify(data)))

  clearForms = ->
    forms_block.innerHTML = ''

  showResult = (data) ->
    forms_block.innerHTML = '<h2>Results of operation:</h2>'
    text_field = document.createElement('TEXTAREA')
    text_field.value = data
    forms_block.appendChild(text_field)
)