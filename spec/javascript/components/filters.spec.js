import {mockDom} from "./mocks";
import {pageFilter} from "../../../app/javascript/components/filters";

describe('filters', () => {
  test('should call function when page is correspond with that given', () => {
    const pageClass = 'rooms-show-page';
    mockDom(`<main class="page-container ${pageClass}"></main>`)

    let result = 0
    pageFilter(pageClass, () => {
      result = 2
    })
    expect(result).toEqual(2)
  })

  test('should reject to call function when page is different with that given', () => {
    let result = 0
    pageFilter('rooms-show-page', () => { result = 2 })
    expect(result).toEqual(0)
  })
})
