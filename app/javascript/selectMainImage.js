if (document.URL.match( /items/ )) {
  document.addEventListener('DOMContentLoaded', () => {
    const thumbnailImgs = document.querySelectorAll('.thumbnails> li')
    let currentNum = 0
    thumbnailImgs[currentNum].classList.add('current-img')

    thumbnailImgs.forEach((thumbnailImg, index) => {
      thumbnailImg.addEventListener('click', () => {
        const itemMainImage = document.getElementById('item-main-image')
        itemMainImage.src = thumbnailImg.firstElementChild.src

        thumbnailImgs[currentNum].classList.remove('current-img')
        currentNum = index
        thumbnailImgs[currentNum].classList.add('current-img')
      })
    });
  })
}