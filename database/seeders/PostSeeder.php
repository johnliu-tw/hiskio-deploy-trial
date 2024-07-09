<?php

namespace Database\Seeders;

use App\Models\Post;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class PostSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Post::create([
            'title' => 'First Post',
            'content' => 'Content of the first post',
            'is_published' => true,
            'published_at' => now(),
        ]);

        Post::create([
            'title' => 'Second Post',
            'content' => 'Content of the second post',
            'is_published' => false,
        ]);
    }
}
