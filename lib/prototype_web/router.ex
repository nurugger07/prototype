defmodule PrototypeWeb.Router do
  use PrototypeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug Phoenix.LiveView.Flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PrototypeWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/genetics", GeneticController, :index
  end
end
