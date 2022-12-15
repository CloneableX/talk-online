const pageFilter = (page, func) => {
  if ($('.page-container').hasClass(page)) {
    func.call(this)
  }
}

export { pageFilter }