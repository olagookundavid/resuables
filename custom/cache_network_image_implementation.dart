CachedNetworkImage(
  imageUrl: 'https://pbs.twimg.com/profile_images/945853318273761280/0U40alJG_400x400.jpg',
  imageBuilder: (context, imageProvider) => Container(
    width: 80.0,
    height: 80.0,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
        image: imageProvider, fit: BoxFit.cover),
    ),
  ),
  placeholder: (context, url) => CircularProgressIndicator(),
  errorWidget: (context, url, error) => Icon(Icons.error),
),