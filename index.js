import { NativeModules, Platform } from 'react-native';

const { RNExtractColor } = NativeModules;

export default {
  extract (imagePath) {
    if (Platform.OS === 'android') {
      return Promise.reject('[react-native-extract-color] Does not support android!');
    }
    
    if (!imagePath || typeof imagePath !== 'string') {
      return Promise.reject('[react-native-extract-color] imagePath is not a valid url!');
    }
  
    if (imagePath.indexOf('http') !== -1) {
      return Promise.reject('[react-native-extract-color] imagePath is not a valid local image path!')
    }
  
    return new Promise((resolve, reject) => {
      RNExtractColor.extract(
        imagePath,
        result => {
          resolve(result);
        },
        error => {
          reject(error);
        }
      )
    })
  }
}
