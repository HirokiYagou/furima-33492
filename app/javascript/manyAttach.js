if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', () => {
    // フォームのボタン表示領域image-listを取得
    const ImageList = document.getElementById('image-list')
    
    // ボタンを表示する関数
    const createInputHTML = () => {
      let imageElementNum = document.querySelectorAll('.input-btn').length
      
      const inputHTML = document.createElement('input')
      inputHTML.setAttribute('id', `item-image-${imageElementNum}`)
      inputHTML.setAttribute('class', 'input-btn')
      inputHTML.setAttribute('name', 'item[images]')
      inputHTML.setAttribute('type', 'file')

      ImageList.appendChild(inputHTML)

      inputHTML.addEventListener('click', () => {
        createInputHTML()
      })
    }

    document.getElementById('item-image').addEventListener('click', () => {
      createInputHTML()
    })

  })
}