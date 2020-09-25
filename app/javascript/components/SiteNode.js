import React from "react"

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

export default SiteNode
