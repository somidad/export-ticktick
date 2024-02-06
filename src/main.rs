use serde::{Deserialize, Serialize};
use std::{
    collections::HashMap,
    io::{self, Write},
};
mod config;

#[derive(Debug, Serialize, Deserialize)]
struct AccessTokenResponse {
    access_token: String,
}

fn main() {
    let client_id = config::CLIENT_ID;
    println!("Visit https://ticktick.com/oauth/authorize?scope=tasks:read&client_id={client_id}&response_type=code to get access token");

    print!("Enter code: ");
    io::stdout().flush().unwrap();
    let mut input = String::new();
    io::stdin().read_line(&mut input).unwrap();
    let code = input.trim();

    let client = reqwest::blocking::Client::new();
    let mut oauth_request_form = HashMap::new();
    // oauth_request_form.insert("cliend_id", client_id);
    // oauth_request_form.insert("client_secret", config::CLIENT_SECRET);
    oauth_request_form.insert("code", code);
    oauth_request_form.insert("grant_type", "authorization_code");
    oauth_request_form.insert("scope", "tasks:read");

    let access_token = client
        .post("https://ticktick.com/oauth/token")
        .basic_auth(client_id, Some(config::CLIENT_SECRET))
        .form(&oauth_request_form)
        .send()
        .unwrap()
        .json::<AccessTokenResponse>()
        .unwrap()
        .access_token;
    println!("Access token: {access_token}");
}
