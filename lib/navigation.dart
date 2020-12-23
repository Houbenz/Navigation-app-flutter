import 'package:flutter/material.dart';
import 'networking.dart';



void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    initialRoute: '/',
    routes: {
      '/': (context) => FirstRoute(),
      '/first': (context) => FirstScreenNamedRoute(),
      '/second': (context) => SecondScreenNamedRoute(),
      '/third': (context) => HomeScreen(),
      '/todos': (context) => TodosScreen(
          todos: List<Todo>.generate(
            20, (i) => Todo('Todo $i', 'a description of what needs to be done for Todos $i'),
          )
      ),
      ExtractArgumentsScreen.routeName: (context) => ExtractArgumentsScreen(),
    },
  ));
}


class FirstRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('First Route'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SecondRoute()),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Route'),
        ),
        body: Center(
          child: Column(
            children: [
              Center(
                child: ElevatedButton(
                  child: Text('main screen'),
                  onPressed: () {
                    //Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: Text('Named Routes Test'),
                  onPressed: () {
                    //Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FirstScreenNamedRoute()),
                    );
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: Text('Navigate to screen that extracts arguments'),
                  onPressed: () {
                    //Navigator.pop(context);
                    Navigator.pushNamed(
                        context, ExtractArgumentsScreen.routeName,
                        arguments: ScreenArguments('Extract Arguments Screen',
                            'This message is extracted in the build method.'));
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: Text('Home Screen (selection Screen)'),
                  onPressed: () {
                    //Navigator.pop(context);
                    Navigator.pushNamed(context, '/third');
                  },
                ),
              ),
              Center(
                child: ElevatedButton(
                  child: Text('todos'),
                  onPressed: () {
                    //Navigator.pop(context);
                    Navigator.pushNamed(context, '/todos');
                  },
                ),
              ),
            ],
          ),
        ));
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => DetailScreen()),
          );
        },
        child: Hero(
          tag: 'imageHero',
          child: Image.network('https://picsum.photos/250?image=9'),
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
            child: Hero(
              tag: 'imageHero',
              child: Image.network('https://picsum.photos/250?image=9'),
            )),
      ),
    );
  }
}

class FirstScreenNamedRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Screen(NamedRoute)'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('go to Second Screen (NamedRoute)'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}

class SecondScreenNamedRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen(NamedRoute)'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('go back ! (NamedRoute)'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}

class ExtractArgumentsScreen extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Text(args.message),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Returning data demo"),
      ),
      body: Center(child: SelectionButton()),
    );
  }
}

class SelectionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _navigateAndDisplaySelection(context);
        },
        child: Text('Pick an option, any option !'));
  }

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SelectionScreen()),
    );

    Scaffold.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick an option'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Yep!');
                },
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, 'Nope');
                },
                child: Text('Nope'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Todo {
  final String title;
  final String description;
  Todo(this.title, this.description);
}


class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({Key key, @required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos'),
      ),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailTodoScreen(todo: todos[index]),
                )
                );
              },
            );
          }),
    );
  }
}

class DetailTodoScreen extends StatelessWidget {

  final Todo todo;

  DetailTodoScreen({Key key,@required this.todo}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detailed Todo'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(todo.description),
      ),
    );
  }
}


