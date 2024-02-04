from flask import Flask, jsonify
import pandas as pd
import html
import json


app = Flask(__name__)

# imports
anime_data = pd.read_csv('data_analysis/1_anime_data/data/anime.csv')
manga_data = pd.read_csv('data_analysis/1_anime_data/data/manga.csv')
manga_ranks = pd.read_csv('data_analysis/1_anime_data/data/manga_ranks.csv')
anime_ranks = pd.read_csv('data_analysis/1_anime_data/data/anime_ranks.csv')

@app.route("/")
def main():
    return '''
    <h2>Available routes:</h2>
    /anime <br>
    /manga <br>
    '''

@app.route("/anime")
def anime():
    anime = anime_data.sample(1)
    anime_dict = anime.to_dict('records')
    anime_title = anime['Title'].iloc[0]
    anime_rank = anime_ranks[anime_ranks['Title']==anime_title]['rank'].iloc[0]
    return f'''
    Random anime recommendation:
    <h2>{anime_title} <br></h2> 
    Ranked: <b>{anime_rank}</b> <br>
    More info: <pre>{json.dumps(anime_dict, indent = 4)}</pre>
    '''

@app.route("/manga")
def manga():
    manga = manga_data.sample(1)
    manga_dict = manga.to_dict('records')
    manga_title = manga['Title'].iloc[0]
    manga_rank = manga_ranks[manga_ranks['Title']==manga_title]['rank'].iloc[0]
    return f'''
    Random manga recommendation: 
    <h2><b>{manga_title}</b> <br></h2>
    Ranked: <b>{manga_rank}</b> <br>
    More info: <pre>{json.dumps(manga_dict, indent = 4)}</pre>
    '''

if __name__ == '__main__':
    app.run(debug = True)