import click
import ckan.plugins.toolkit as tk

from . import utils

_vocabularies = ["fields_of_research", "geospatial_topics", "fields_theme"]

@click.group(short_help="ckanext-agls CLI")
def agls():
    """ckanext-agls CLI
    """
    pass

@agls.group()
def vocabulary():
    """Tag management
    """


@vocabulary.command()
@click.argument("vocab", type=click.Choice(_vocabularies))
def list(vocab):
    try:
        v = tk.get_action("vocabulary_show")({"ignore_auth": True}, {"id": vocab})
    except tk.ObjectNotFound:
        tk.error_shout(f"Vocabulary {vocab} does not exist.")
        raise click.Abort()
    for tag in v["tags"]:
        click.echo(tag["name"])


@vocabulary.command()
@click.argument("vocab", type=click.Choice(_vocabularies))
def create(vocab):
    factory = getattr(utils, "create_" + vocab)
    factory()
    click.secho("Done", fg="green")
