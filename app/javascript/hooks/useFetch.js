import { useState, useEffect } from 'react'

const queryString = params =>
  Object.keys(params)
    .map(key => `${key}=${params[key]}`)
    .join("&")

const createUrl = (url, queryOptions) => {
  return url + "?" + queryString(queryOptions)
}

export default (url, options = { body: {}, query: {} }) => {
  const [data, setData] = useState({
    response: null,
    error: false,
    loading: true,
  })

  useEffect(() => {
    setData({ ...data, error: null, loading: true })
    const attributes = {
      method: options.method || 'GET',
      headers: {
        'Content-Type': 'application/json',
      }
    }
    if (attributes.method != 'GET') attributes.body = options.body

    fetch(createUrl(url, options.query), attributes)
      .then(async response => {
        const data = await response.json()
        setData({
          response: data,
          error: !response.ok,
          loading: false,
        })
      })
      .catch(error => {
        setData({
          response: null,
          error: error.message,
          loading: false,
        })
      })
  }, [url, JSON.stringify(options)])

  return data
}