import React from "react"
import PropTypes from 'prop-types'

const isEmptyObject = (obj) => Object.keys(obj).length === 0

const renderNodes = (nodes) =>
  <ul>
    {
      Object.keys(nodes).map((key, index) =>
        <SiteNode key={index} node={nodes[key]} />
      )
    }
  </ul>

const SiteNode = ({ node }) => {
  const { nodes } = node
  return (
    <li>
      <a href={node.full_path} id={node.key}>{node.name}</a>
      {!isEmptyObject(nodes) && renderNodes(nodes)}
    </li>
  )
}

SiteNode.propTypes = {
  node: PropTypes.shape({
    name: PropTypes.string,
    key: PropTypes.string,
    full_path: PropTypes.string,
    nodes: PropTypes.object
  })
}

export default SiteNode
