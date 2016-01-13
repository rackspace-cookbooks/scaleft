scaleft Cookbook
================
Installs and configures ScaleFT server tools

Requirements
------------
Only works with RHEL and Debian based distros.

Attributes
----------
#### scaleft::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['scaleft']['initial_url']</tt></td>
    <td>String</td>
    <td>your scaleft endpoint</td>
    <td>nil</td>
  </tr>
</table>

Usage
-----
#### scaleft::default

Just include `scaleft` in your node's `run_list`:

```json
{
  "name":"my_node",
  "normal": {
    "scaleft": {
      "initial_url": "https://scaleft.company.com"
    }
  },
  "run_list": [
    "recipe[scaleft]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors:: Jim Rosser (jim.rosser@rackspace.com)
