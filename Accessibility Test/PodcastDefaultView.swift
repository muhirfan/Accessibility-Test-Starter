//
//  PodcastDefaultView.swift
//  Accessibility Test
//
//  Created by Muhammad Irfan on 25/06/25.
//

import SwiftUI

struct PodcastView: View {
    @State private var isFavorite = false
    @State private var speed: Double = 1.0
    @State private var episodes: [Episode] = [
        Episode(title: "Welcome to Podster", duration: "5 minutes"),
        Episode(title: "Accessibility Matters", duration: "12 minutes"),
        Episode(title: "VoiceOver in Practice", duration: "15 minutes")
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 24) {

                    // MARK: - Artwork with Overlay
                    ZStack(alignment: .bottomLeading) {
                        Image("podcastcover") // Replace with a real asset in your Assets.xcassets
                            .resizable()
                            .scaledToFill()
                            .frame(height: 280)
                            .clipped()

                        // Overlay with host info
                        VStack(alignment: .leading, spacing: 4) {
                            Text("🎙️ Hosted by")
                                .font(.caption)
                                .foregroundColor(.white.opacity(0.8))
                            Text("Avery Soundwell")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                            Text("avery.soundwell@podster.fm")
                                .font(.subheadline)
                                .foregroundColor(.white.opacity(0.8))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(
                            LinearGradient(gradient: Gradient(colors: [.black.opacity(0.6), .clear]), startPoint: .bottom, endPoint: .top)
                        )
                    }
                    

                    // MARK: - Controls (Volume, Favorite, Refresh)
                    VStack(spacing: 16) {
                        HStack {
                            Text("Now Playing")
                                .font(.title2)
                                .bold()

                            Spacer()

                            Button(action: {
                            }) {
                                Image(systemName: "arrow.clockwise")
                                    .padding(8)
                                    .background(Color(.tertiarySystemBackground))
                                    .clipShape(Circle())
                            }
                        }

                        VStack(alignment: .leading) {
                            Text("Speed")
                                .font(.headline)

                            Slider(value: $speed, in: 0.5...2.0, step: 0.25)
                        }

                        // Favorite Button
                        Button(action: {
                            isFavorite.toggle()
//                            announceUpdate(message: isFavorite ? "Marked as favorite" : "Removed from favorites")
                        }) {
                            HStack {
                                Image(systemName: isFavorite ? "heart.fill" : "heart")
                                Text(isFavorite ? "Unfavorite" : "Favorite")
                                    .fontWeight(.semibold)
                            }
                            .foregroundColor(isFavorite ? .red : .primary)
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(12)
                        }
                    }
                    .padding(.horizontal)

                    // MARK: - Episodes
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Episodes")
                            .font(.title3)
                            .bold()
                            .padding(.horizontal)

                        ForEach(episodes) { episode in
                            EpisodeRowDefault(title: episode.title, duration: episode.duration)
                        }
                    }

                    // MARK: - CTA Button
                    Button(action: {
//                        announceUpdate(message: "Subscription ordered successfully")
                    }) {
                        Text("Order Subscription")
                            .bold()
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(14)
                            .padding(.horizontal)
                    }
                }
            }
            .navigationBarHidden(true)
        }
    }

//    // MARK: - Accessibility Announcement
//    func announceUpdate(message: String) {
//        UIAccessibility.post(notification: .announcement, argument: message)
//    }
}

// MARK: - Reusable Accessible Row
struct EpisodeRowDefault: View {
    let title: String
    let duration: String

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "waveform")
                .foregroundColor(.blue)
                .frame(width: 24)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(duration)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer()

            Image(systemName: "play.circle.fill")
                .foregroundColor(.blue)
                .font(.title2)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color(.systemBackground))
    }
}


#Preview {
    PodcastView()
}
