class UpcomingJson {
    UpcomingJson({
        required this.typeMatches,
        required this.filters,
        required this.appIndex,
        required this.responseLastUpdated,
    });

    final List<TypeMatch> typeMatches;
    final Filters? filters;
    final AppIndex? appIndex;
    final String? responseLastUpdated;

    factory UpcomingJson.fromJson(Map<String, dynamic> json){
        return UpcomingJson(
            typeMatches: json["typeMatches"] == null ? [] : List<TypeMatch>.from(json["typeMatches"]!.map((x) => TypeMatch.fromJson(x))),
            filters: json["filters"] == null ? null : Filters.fromJson(json["filters"]),
            appIndex: json["appIndex"] == null ? null : AppIndex.fromJson(json["appIndex"]),
            responseLastUpdated: json["responseLastUpdated"],
        );
    }

}

class AppIndex {
    AppIndex({
        required this.seoTitle,
        required this.webUrl,
    });

    final String? seoTitle;
    final String? webUrl;

    factory AppIndex.fromJson(Map<String, dynamic> json){
        return AppIndex(
            seoTitle: json["seoTitle"],
            webUrl: json["webURL"],
        );
    }

}

class Filters {
    Filters({
        required this.matchType,
    });

    final List<String> matchType;

    factory Filters.fromJson(Map<String, dynamic> json){
        return Filters(
            matchType: json["matchType"] == null ? [] : List<String>.from(json["matchType"]!.map((x) => x)),
        );
    }

}

class TypeMatch {
    TypeMatch({
        required this.matchType,
        required this.seriesMatches,
    });

    final String? matchType;
    final List<SeriesMatch> seriesMatches;

    factory TypeMatch.fromJson(Map<String, dynamic> json){
        return TypeMatch(
            matchType: json["matchType"],
            seriesMatches: json["seriesMatches"] == null ? [] : List<SeriesMatch>.from(json["seriesMatches"]!.map((x) => SeriesMatch.fromJson(x))),
        );
    }

}

class SeriesMatch {
    SeriesMatch({
        required this.seriesAdWrapper,
        required this.adDetail,
    });

    final SeriesAdWrapper? seriesAdWrapper;
    final AdDetail? adDetail;

    factory SeriesMatch.fromJson(Map<String, dynamic> json){
        return SeriesMatch(
            seriesAdWrapper: json["seriesAdWrapper"] == null ? null : SeriesAdWrapper.fromJson(json["seriesAdWrapper"]),
            adDetail: json["adDetail"] == null ? null : AdDetail.fromJson(json["adDetail"]),
        );
    }

}

class AdDetail {
    AdDetail({
        required this.name,
        required this.layout,
        required this.position,
    });

    final String? name;
    final String? layout;
    final int? position;

    factory AdDetail.fromJson(Map<String, dynamic> json){
        return AdDetail(
            name: json["name"],
            layout: json["layout"],
            position: json["position"],
        );
    }

}

class SeriesAdWrapper {
    SeriesAdWrapper({
        required this.seriesId,
        required this.seriesName,
        required this.matches,
    });

    final int? seriesId;
    final String? seriesName;
    final List<Match> matches;

    factory SeriesAdWrapper.fromJson(Map<String, dynamic> json){
        return SeriesAdWrapper(
            seriesId: json["seriesId"],
            seriesName: json["seriesName"],
            matches: json["matches"] == null ? [] : List<Match>.from(json["matches"]!.map((x) => Match.fromJson(x))),
        );
    }

}

class Match {
    Match({
        required this.matchInfo,
    });

    final MatchInfo? matchInfo;

    factory Match.fromJson(Map<String, dynamic> json){
        return Match(
            matchInfo: json["matchInfo"] == null ? null : MatchInfo.fromJson(json["matchInfo"]),
        );
    }

}

class MatchInfo {
    MatchInfo({
        required this.matchId,
        required this.seriesId,
        required this.seriesName,
        required this.matchDesc,
        required this.matchFormat,
        required this.startDate,
        required this.endDate,
        required this.state,
        required this.status,
        required this.team1,
        required this.team2,
        required this.venueInfo,
        required this.seriesStartDt,
        required this.seriesEndDt,
        required this.isTimeAnnounced,
        required this.stateTitle,
        required this.isFantasyEnabled,
    });

    final int? matchId;
    final int? seriesId;
    final String? seriesName;
    final String? matchDesc;
    final String? matchFormat;
    final String? startDate;
    final String? endDate;
    final String? state;
    final String? status;
    final Team? team1;
    final Team? team2;
    final VenueInfo? venueInfo;
    final String? seriesStartDt;
    final String? seriesEndDt;
    final bool? isTimeAnnounced;
    final String? stateTitle;
    final bool? isFantasyEnabled;

    factory MatchInfo.fromJson(Map<String, dynamic> json){
        return MatchInfo(
            matchId: json["matchId"],
            seriesId: json["seriesId"],
            seriesName: json["seriesName"],
            matchDesc: json["matchDesc"],
            matchFormat: json["matchFormat"],
            startDate: json["startDate"],
            endDate: json["endDate"],
            state: json["state"],
            status: json["status"],
            team1: json["team1"] == null ? null : Team.fromJson(json["team1"]),
            team2: json["team2"] == null ? null : Team.fromJson(json["team2"]),
            venueInfo: json["venueInfo"] == null ? null : VenueInfo.fromJson(json["venueInfo"]),
            seriesStartDt: json["seriesStartDt"],
            seriesEndDt: json["seriesEndDt"],
            isTimeAnnounced: json["isTimeAnnounced"],
            stateTitle: json["stateTitle"],
            isFantasyEnabled: json["isFantasyEnabled"],
        );
    }

}

class Team {
    Team({
        required this.teamId,
        required this.teamName,
        required this.teamSName,
        required this.imageId,
    });

    final int? teamId;
    final String? teamName;
    final String? teamSName;
    final int? imageId;

    factory Team.fromJson(Map<String, dynamic> json){
        return Team(
            teamId: json["teamId"],
            teamName: json["teamName"],
            teamSName: json["teamSName"],
            imageId: json["imageId"],
        );
    }

}

class VenueInfo {
    VenueInfo({
        required this.id,
        required this.ground,
        required this.city,
        required this.timezone,
        required this.latitude,
        required this.longitude,
    });

    final int? id;
    final String? ground;
    final String? city;
    final String? timezone;
    final String? latitude;
    final String? longitude;

    factory VenueInfo.fromJson(Map<String, dynamic> json){
        return VenueInfo(
            id: json["id"],
            ground: json["ground"],
            city: json["city"],
            timezone: json["timezone"],
            latitude: json["latitude"],
            longitude: json["longitude"],
        );
    }

}
