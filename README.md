# react-native-extract-color [![npm](https://img.shields.io/npm/v/react-native-extract-color.svg)](https://www.npmjs.com/package/react-native-extract-color)
> Extract colors from an image

<p align="center">
  <img width="250" src="https://raw.githubusercontent.com/zzetao/react-native-extract-color/master/screenshots/demo.gif">
</p>

## Usage
```javascript
import ExtractColor from 'react-native-extract-color';

try {
  const colors = await ExtractColor.extract('/Users/zzetao/xx/../xx/LocalImagePath.png');
  /*
    colors:
    {
      primaryColor: '#hex',
      backgroundColor: '#hex',
      secondaryColor: '#hex',
      detailColor: '#hex'
    }
  */
} catch(e) {
  console.warn('error: ', e);
}
```
  
## Getting started

`$ yarn add react-native-extract-color`

### Mostly automatic installation

`$ react-native link react-native-extract-color`

### Manual installation

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-extract-color` and add `RNExtractColor.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNExtractColor.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)


## License

Copyright © 2018, [zzetao](https://github.com/zzetao).
Released under the [MIT License](LICENSE).