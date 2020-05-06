import React from 'react';
import {AppRegistry, StyleSheet, Text, View, TouchableOpacity, NativeModules} from 'react-native';

var RNModules = NativeModules.Modules;
class RNHighScores extends React.Component {
  render() {
    var contents = this.props['scores'].map((score) => (
      <Text key={score.name}>
        {score.name}:{score.value}
        {'\n'}
      </Text>
    ));
    return (
      <View style={styles.container}>
        <Text style={styles.highScoresTitle}>2048 High Scores! Good!</Text>
        <Text style={styles.scores}>{contents}</Text>
		<Text style={styles.scores}>helloworld</Text>
		<Text style={styles.scores}>helloworldhelloworldhelloworldhelloworldhelloworld</Text>
    <TouchableOpacity
               onPress={()=>RNModules.RNOpenOneVC('测试')}>
                   <Text>Hello World!</Text>
            </TouchableOpacity> 
      </View>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  },
  highScoresTitle: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  scores: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

// Module name
AppRegistry.registerComponent('RNHighScores', () => RNHighScores);