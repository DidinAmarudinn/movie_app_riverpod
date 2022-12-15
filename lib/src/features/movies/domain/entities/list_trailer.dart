// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'list_trailer.freezed.dart';
part 'list_trailer.g.dart';


@freezed
 class ListTrailerVideo with _$ListTrailerVideo {
@JsonSerializable(explicitToJson: true)
    const factory ListTrailerVideo({
        int? id,
        List<Trailer>? results,
    }) = _ListTrailerVideo;

     factory ListTrailerVideo.fromJson(Map<String, dynamic> json) =>
      _$ListTrailerVideoFromJson(json);
}

@freezed
 class Trailer with _$Trailer {
    const factory Trailer({
        String? name,
        String? key,
        String? site,
        int? size,
        String? type,
        bool? official,
        String? id,
    }) = _Trailer;

     factory Trailer.fromJson(Map<String, dynamic> json) =>
      _$TrailerFromJson(json);
}
