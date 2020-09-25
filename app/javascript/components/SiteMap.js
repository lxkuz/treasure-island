import React from 'react'
import SiteNode from './SiteNode'
import useFetch from '../hooks/useFetch'

const SITE_MAP_URL = '/api/v1/site_map'
  
const SiteMap = () => {
  const { response, error, loading } = useFetch(SITE_MAP_URL);
  return (
    <>
      <h1>Site Map</h1>
      { loading && <p className='loading'>Loading...</p> }
      { error && <p className='error'>ERROR: {error}</p> }
      { response && <ul><SiteNode node={response} /></ul> }
    </>
  )
}

export default SiteMap
