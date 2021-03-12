#!/usr/bin/env python
import os
import torch

# from bot import EncoderRNN, LuongAttnDecoderRNN, Voc, GreedySearchDecoder, evaluate, loadPrepareData
from dotenv import load_dotenv
from flask import Flask, request
from rich import print

from bot import GreedySearchDecoder, evaluate
from bot import encoder, decoder, voc

# PATH = "./data/save/cb_model/cornell movie-dialogs corpus/2-2_500/4000_checkpoint.tar"
# corpus_name = "cornell movie-dialogs corpus"
# corpus = "./data/cornell movie-dialogs corpus"
# save_dir = os.path.join("data", "save")
# datafile = os.path.join(corpus, "formatted_movie_lines.txt")

# device = torch.device("cuda" if USE_CUDA else "cpu")

# hidden_size = 500
# encoder_n_layers = 2
# decoder_n_layers = 2
# dropout = 0.1

# def load() -> tuple:
#     """load bot stuff."""
#     # read vocs
#     # load/assemble voc and pairs
#     voc, pairs = loadpreparedata(corpus, corpus_name, datafile, save_dir)

#     # loadfilename = "./data/save/cb_model/cornell\ movie-dialogs\ corpus/2-2_500/4000_checkpoint.tar"
#     checkpoint_iter = 4000
#     loadfilename = os.path.join(save_dir, model_name, corpus_name,
#                             '{}-{}_{}'.format(encoder_n_layers, decoder_n_layers, hidden_size),
#                             '{}_checkpoint.tar'.format(checkpoint_iter))

#     train_device_equal_use_device = false
#     # if loading on same machine the model was trained on
#     if train_device_equal_use_device:
#         checkpoint = torch.load(loadfilename)
#     # if loading a model trained on gpu to cpu
#     else:
#         checkpoint = torch.load(loadfilename, map_location=torch.device('cpu'))
#     encoder_sd = checkpoint['en']
#     decoder_sd = checkpoint['de']
#     encoder_optimizer_sd = checkpoint['en_opt']
#     decoder_optimizer_sd = checkpoint['de_opt']
#     embedding_sd = checkpoint['embedding']
#     voc.__dict__ = checkpoint['voc_dict']


#     print('Building encoder and decoder ...')
#     # Initialize word embeddings
#     embedding = nn.Embedding(voc.num_words, hidden_size)
#     embedding.load_state_dict(embedding_sd)
#     # Initialize encoder & decoder models
#     encoder = EncoderRNN(hidden_size, embedding, encoder_n_layers, dropout)
#     decoder = LuongAttnDecoderRNN(attn_model, embedding, hidden_size, voc.num_words, decoder_n_layers, dropout)
#     encoder.load_state_dict(encoder_sd)
#     decoder.load_state_dict(decoder_sd)
#     # Use appropriate device
#     encoder = encoder.to(device)
#     decoder = decoder.to(device)
#     print('Models built and ready to go!')

#     searcher = GreedySearchDecoder(encoder, decoder)

#     return (encoder, decoder, searcher, voc)

# encoder, decoder, searcher, voc = load()

app = Flask(__name__)

app.host = "localhost"


@app.route("/")
def index() -> str:
    """Ask questions to the dumb bot."""
    if request.method == "POST":
        print(request.form)
        message = request.form["message"]
        print("message:", message)
        searcher = GreedySearchDecoder(encoder, decoder)
        output_words = evaluate(encoder, decoder, searcher, voc, message)
        output_words[:] = [x for x in output_words if not (x == "EOS" or x == "PAD")]
        answer = " ".join(output_words)
        return dict(answer=answer)
    else:
        return "This API only supports POST requests with a `message` POST variable."


if __name__ == "__main__":
    app.run(host="localhost", debug=False)
