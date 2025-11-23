//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import desktop_multi_window
import desktop_webview_window
import fvp
import path_provider_foundation
import rive_native
import screen_retriever_macos
import video_player_avfoundation
import window_manager

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FlutterMultiWindowPlugin.register(with: registry.registrar(forPlugin: "FlutterMultiWindowPlugin"))
  DesktopWebviewWindowPlugin.register(with: registry.registrar(forPlugin: "DesktopWebviewWindowPlugin"))
  FvpPlugin.register(with: registry.registrar(forPlugin: "FvpPlugin"))
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  RiveNativePlugin.register(with: registry.registrar(forPlugin: "RiveNativePlugin"))
  ScreenRetrieverMacosPlugin.register(with: registry.registrar(forPlugin: "ScreenRetrieverMacosPlugin"))
  FVPVideoPlayerPlugin.register(with: registry.registrar(forPlugin: "FVPVideoPlayerPlugin"))
  WindowManagerPlugin.register(with: registry.registrar(forPlugin: "WindowManagerPlugin"))
}
