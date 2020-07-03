import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:sampleproject/constant.dart';
import 'package:sampleproject/customAppBar.dart';
import 'package:sampleproject/drawers.dart';
import 'package:sampleproject/models/channel_model.dart';
import 'package:sampleproject/models/video_model.dart';
import 'package:sampleproject/video_carousel.dart';
import 'package:sampleproject/video_screen.dart';
import 'package:sampleproject/services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Channel _channel;
  bool _isLoading = false;

  final decor = BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      boxShadow: [
        BoxShadow(offset: Offset(0, 2), blurRadius: 5, color: Colors.grey)
      ]);

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UC7B3rQRKN5_4rvhFQoNEiwQ');
    setState(() {
      _channel = channel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarrr(),
      drawer: drawers,
      backgroundColor: Colors.white,
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel.videos.length != int.parse(_channel.videoCount) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  _loadMoreVideos();
                }
                return false;
              },
              child: SingleChildScrollView(

                child: Container(
                    
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height >= 775.0
                        ? MediaQuery.of(context).size.height
                        : 775.0,
                  //  padding: EdgeInsets.only(left: 10, top: 20),
                    child: Column(children: <Widget>[
                      TitleBar(),
                      buildVideoCarousel(context)
                     
                    ])),


              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor, // Red
                ),
              ),
            ),
    );
  }

  Container buildVideoCarousel(BuildContext context) {
    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _channel.videos.length,
                        itemBuilder: (BuildContext context, int index) {
                          Video video = _channel.videos[index];
                          return _buildVideo(video);
                        },
                      ),
                    );
  }

    _buildVideo(Video video) {
    return Container(
      height: 200,
      width: 160,
      child: Material(
        color: Colors.white,
        child: InkWell(
          child: Container(
            padding: EdgeInsets.only(right: 10),
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image(
                          width: 140.0,
                          height: 120,
                          image: NetworkImage(video.thumbnailUrl),
                          fit: BoxFit.fill),
                    ),
                    Positioned(
                      left: 40,
                      bottom: 30,
                      child: IconButton(
                        iconSize: 40,
                        icon: SvgPicture.asset("assets/icons/play-button.svg"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => VideoScreen(id: video.id),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height:5),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(video.title.toUpperCase(),
                      style: TextStyle(
                          color: Colors.grey[700], fontWeight: FontWeight.w500),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textAlign: TextAlign.left),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  _loadMoreVideos() async {
    _isLoading = true;
    List<Video> moreVideos = await APIService.instance
        .fetchVideosFromPlaylist(playlistId: _channel.uploadPlaylistId);
    List<Video> allVideos = _channel.videos..addAll(moreVideos);
    setState(() {
      _channel.videos = allVideos;
    });
    _isLoading = false;
  }
}
