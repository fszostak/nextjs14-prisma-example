'use client'
import { useState } from 'react'
import styles from './page.module.css'
import { getPosts, createPost, updatePost, deletePost } from '@/actions/posts'

export default function Home() {
  const [posts, setPosts] = useState([])
  const listPosts = (posts) => {
    console.log(posts)
    return (
      <ul>
        {posts?.length > 0 &&
          posts.map((post) => (
            <li key={post.id}>
              {post.id} - {post.title} - {post.content}
            </li>
          ))}
      </ul>
    )
  }
  const handleCreate = () => {
    console.log('create clicked')
    createPost({ title: 'Titulo', content: 'Content', authorId: 1 })
    handleList()
  }
  const handleUpdate = () => {
    console.log('update clicked')
    updatePost(2, { title: 'Titulo Updated', content: 'Content New', authorId: 1 })
    handleList()
  }
  const handleDelete = () => {
    console.log('delete clicked')
    deletePost(5)
    handleList()
  }
  const handleList = () => {
    getPosts().then((res) => setPosts(res))
  }
  return (
    <main className={styles.main}>
      <div className={styles.description}>{listPosts(posts)}</div>
      <button onClick={handleList}>List</button>
      <button onClick={handleCreate}>Create</button>
      <button onClick={handleUpdate}>Update</button>
      <button onClick={handleDelete}>Delete</button>
    </main>
  )
}
