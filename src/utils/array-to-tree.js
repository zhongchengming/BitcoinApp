'use strict';
let keyBy = require('lodash.keyby');

let createTree = function (array, rootNodes, customID, childrenName) {
  let tree = [];

  for (let rootNode in rootNodes) {
    let node = rootNodes[rootNode];
    let childNode = array[node[customID]];

    if (!node && !rootNodes.hasOwnProperty(rootNode)) {
      continue;
    }

    if (childNode) {
      node[childrenName] = createTree(array, childNode, customID, childrenName);
    }

    tree.push(node);
  }

  return tree;
};

let groupByParents = function (array, options) {
  let arrayByID = keyBy(array, options.customID);

  return array.reduce(function (prev, item) {
    let parentID = item[options.parentProperty]
    if (!parentID || !arrayByID.hasOwnProperty(parentID)) {
      parentID = options.rootID;
    }

    if (parentID && prev.hasOwnProperty(parentID)) {
      prev[parentID].push(item);
      return prev;
    }

    prev[parentID] = [item];
    return prev;
  }, {});
};

/**
 * arrayToTree
 * Convert a plain array of nodes (with pointers to parent nodes) to a nested
 * data structure
 *
 * @name arrayToTree
 * @function
 *
 * @param {Array} data An array of data
 * @param {Object} options An object containing the following fields:
 *
 *  - `parentProperty` (String): A name of a property where a link to
 *     a parent node could be found. Default: 'parent_id'
 *  - `customID` (String): An unique node identifier. Default: 'id'
 *
 * @return {Array} Result of transformation
 */
export function arrayToTree (data, options) {
  options = Object.assign({
    parentProperty: 'parent_id',
    customID: 'id',
    rootID: '0',
    childrenProperty: 'children'
  }, options);

  if (!Array.isArray(data)) {
    throw new TypeError('Expected an object but got an invalid argument');
  }

  let grouped = groupByParents(data, options);
  return createTree(grouped, grouped[options.rootID], options.customID, options.childrenProperty);
}
