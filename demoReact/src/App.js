import './App.css';
import Player from './component/Player';


function App() {
  const manifestUri =
    'https://storage.googleapis.com/shaka-demo-assets/angel-one/dash.mpd';

  const hlsUrl = 'https://vod.devinflearn.com/45d119c1-a6df-48ae-aaae-2eb7662818f1/hls/acb3706ba6f092664f950925899f2382611d99b7.m3u8';
  const encryptUrl = 'https://vod.devinflearn.com/encrypted/45d119c1-a6df-48ae-aaae-2eb7662818f1/master.m3u8';


  return (
    <div>
      <Player src={hlsUrl} />
    </div>
  );
}



export default App;
