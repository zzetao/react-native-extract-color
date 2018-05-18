
# react-native-extract-color
> Extract colors from an image

## Getting started

`$ npm install react-native-extract-color --save`

### Mostly automatic installation

`$ react-native link react-native-extract-color`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-extract-color` and add `RNExtractColor.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNExtractColor.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<


## Usage
```javascript
import RNExtractColor from 'react-native-extract-color';

const colors = await RNExtractColor.extract('/Users/zzetao/xx/../xx/LocalImagePath.png');
/*
  colors: {
    primaryColor: '#FFFFFF',
    backgroundColor: '#FFFFFF',
    secondaryColor: '#FFFFFF',
    detailColor: '#FFFFFF'
  }
*/
```
  